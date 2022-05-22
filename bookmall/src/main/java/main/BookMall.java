package main;

import java.util.List;

import dao.BookDao;
import dao.CartDao;
import dao.CategoryDao;
import dao.MemberDao;
import dao.OrderDao;
import vo.BookVo;
import vo.CartVo;
import vo.CategoryVo;
import vo.MemberVo;
import vo.OrderVo;

public class BookMall {

	public static void main(String[] args) {
		bookmallReset();
		System.out.println("==================회원===================");

		memberInfo();
		System.out.println("==============카테고리==================");

		categoryInfo();
		System.out.println("=============책=======================");

		bookInfo();
		System.out.println("==============카트===================");

		cartInfo();
		System.out.println("==============주문===================");

		orderInfo();
		System.out.println("============주문도서=====================");

		orderBookInfo();
	}

	private static void bookmallReset() {
		new OrderDao().DeleteAllByBook();
		new OrderDao().autoIncrementResetByBook();
		new OrderDao().DeleteAll();
		new OrderDao().autoIncrementReset();
		new CartDao().DeleteAll();
		new CartDao().autoIncrementReset();
		new BookDao().DeleteAll();
		new BookDao().autoIncrementReset();
		new CategoryDao().DeleteAll();
		new CategoryDao().autoIncrementReset();
		new MemberDao().DeleteAll();
		new MemberDao().autoIncrementReset();
	}

	private static void memberInfo() {
		new MemberDao().insert("둘리", "123456", "010-1234-5678", "dooly@hanmail.net");
		new MemberDao().insert("또치", "777775", "010-4444-4444", "ddoch@gmail.com");
		new MemberDao().insert("마이콜", "111111", "010-7777-7777", "mycall@gmail.com");

		List<MemberVo> list = new MemberDao().findAll();
		for (MemberVo vo : list)
			System.out.println(vo);
	}

	private static void categoryInfo() {
		new CategoryDao().insert("판타지");
		new CategoryDao().insert("IT");
		new CategoryDao().insert("추리");

		List<CategoryVo> list = new CategoryDao().findAll();
		for (CategoryVo vo : list)
			System.out.println(vo);
	}

	private static void bookInfo() {
		new BookDao().insert("7년후", 7000L, 1L);
		new BookDao().insert("이것이 Java다", 2000L, 2L);
		new BookDao().insert("이것이 MariaDB다", 2000L, 3L);

		List<BookVo> list = new BookDao().findAll();
		for (BookVo vo : list)
			System.out.println(vo);
	}

	private static void cartInfo() {
		new CartDao().insert(1L, 1L, 2L);
		new CartDao().insert(1L, 3L, 1L);
		new CartDao().insert(1L, 2L, 1L);

		List<CartVo> list = new CartDao().findAll();
		for (CartVo vo : list)
			System.out.println(vo);
	}

	private static void orderInfo() {
		new OrderDao().insert("20120506-0001", 5000L, "해운대달맞이로...", 1L);

		List<OrderVo> list = new OrderDao().findAll();
		for (OrderVo vo : list)
			System.out.println(vo);
	}

	private static void orderBookInfo() {
		new OrderDao().insertByBook(1L, 1L, 2L);
		new OrderDao().insertByBook(3L, 1L, 1L);
		new OrderDao().insertByBook(2L, 1L, 1L);

		List<OrderVo> list = new OrderDao().findByBook();
		for (OrderVo vo : list)
			System.out.println(vo.toStringByBook());
	}
}