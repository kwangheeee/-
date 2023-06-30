package com.library.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.library.dao.BookDao;
import com.library.dao.RentDao;
import com.library.service.BookService;
import com.library.vo.Book;
import com.library.vo.Criteria;
import com.oreilly.servlet.MultipartRequest;
import com.utils.FileUtil;
import com.utils.JSFunction;

@WebServlet("*.book")
public class BookController extends HttpServlet{

	BookService bs = new BookService();
	RentDao rd = new RentDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDao dao = new BookDao();
		String uri = req.getRequestURI();
		System.out.println("요청 uri : " + uri);
		
		if(uri.indexOf("list") > 0) {
			
			// 검색조건 세팅
			Criteria cri = new Criteria(req.getParameter("searchField"), req.getParameter("searchWord"), req.getParameter("pageNo"));
			
			// 리스트 조회 및 요청 객체에 저장
			req.setAttribute("map", bs.getList(cri));
			
			// 포워딩
			req.getRequestDispatcher("./list.jsp").forward(req, resp);
		}else if(uri.indexOf("delete") > 0){
//			int res = bs.delete(req.getParameter("delNo"));
//			if(res > 0) {
				dao.delete(req.getParameter("delNo"));
				
				req.setAttribute("message", "00건 삭제되었습니다");
				req.getRequestDispatcher("./list.book").forward(req, resp);
//			}else {
//				req.getRequestDispatcher("./list.book").forward(req, resp);
//			}
		}else if(uri.indexOf("write") > 0) {
			resp.sendRedirect("./write.jsp");
			
		}else if(uri.indexOf("view") > 0) {
			Book book = dao.selectOn(req.getParameter("no"));
			req.setAttribute("dto", book);
			req.getRequestDispatcher("./view.jsp").forward(req, resp);
			
		}
		
		
//		이건 get을 호출하고 마지막에 doPost를 호출한다
//		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookDao dao = new BookDao();
		String uri = req.getRequestURI();
		
		System.out.println("요청 uri : " + uri);
		
		if(uri.indexOf("write") > 0) {
			String saveDirectory = "C:\\Users\\user\\git\\JSPa\\library_0427\\webapp\\image\\bookimg";
			MultipartRequest mr =  FileUtil.uploadFile(req, saveDirectory, 1024*1000);
			
			String ofile = mr.getFilesystemName("bookImg");
			System.out.println(ofile);
			String sfile = "";
			if(ofile != null && !"".equals(ofile)) {
				sfile = FileUtil.fileNameChange(saveDirectory, ofile);
			}
			
			String title =req.getParameter("title");
			String author = req.getParameter("author");
			
			Book b = new Book();
			// mr로 받아줘야함
			b.setId(mr.getParameter("id"));
			b.setTitle(mr.getParameter("title"));
			b.setRentyn("N");
			b.setAuthor(mr.getParameter("author"));
			b.setOfile(ofile);
			b.setSfile(sfile);
			
			int res = dao.insert(b);
			System.out.println(res);
			if(res > 0) {
				JSFunction.alertLocation(resp, "./list.book", "추가되었습니다.");
			}else {
				JSFunction.alertBack(resp, "실패");
			}
		}else if(uri.indexOf("rent") > 0) {
			// 로그인한 사용자인지 확인
			HttpSession session = req.getSession();
			
			// 로그인 후 이용 가능하게 설정
			if(session.getAttribute("userId") == null) {		
				JSFunction.alertBack(resp, "로그인 하고 와라");
			}
			
			// 대여하기 - 책번호, 로그인아이디 
			Book book = new Book();
			book.setNo(req.getParameter("no"));
			book.setId(session.getAttribute("userId").toString());
			
			int res = dao.rentBook(book);
			if(res > 0) {
				JSFunction.alertLocation(resp, "./view.book?no="+book.getNo(), "대여성공");
			}else {
				JSFunction.alertBack(resp, "대여중 오류발생");
			}
			
			
			
		// 반납
		}else if(uri.indexOf("return") > 0) {
			String no = req.getParameter("no");
			int res = dao.returnBook(no);
			if(res > 0) {
				JSFunction.alertLocation(resp, "./view.book?no="+no, "반납성공");
			}else {
				JSFunction.alertBack(resp, "대여중 오류발생");
			}

		}else {
			doGet(req, resp);
		}
	}
	
	public BookController() {
	}

}
