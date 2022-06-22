package dao.test;

import java.util.List;
import dao.OrderDao;
import vo.OrderVo;

public class OrderDaoTest {

	public static void main(String[] args) {
		testInsert();
	}

	private static void testFindAll() {
		List<OrderVo> list = new OrderDao().findAll();
		for (OrderVo vo : list)
			System.out.println(vo);
	}

	private static void testFindByBook() {
		List<OrderVo> list = new OrderDao().findByBook();
		for (OrderVo vo : list)
			System.out.println(vo);
	}

	private static void testInsert() {
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();

		vo.setOrderNumber("20120506-0001");
		vo.setPay(5000L);
		vo.setAddress("해운대달맞이로...");
		vo.setMemberNo(1L);
		dao.insert(vo);
	}

	private static void testInsertByBook() {
		OrderDao dao = new OrderDao();
		OrderVo vo = new OrderVo();

		vo.setBookNo(1L);
		vo.setNo(1L);
		vo.setCount(2L);
		dao.insertByBook(vo);

		vo.setBookNo(3L);
		vo.setNo(1L);
		vo.setCount(1L);
		dao.insertByBook(vo);

		vo.setBookNo(2L);
		vo.setNo(1L);
		vo.setCount(1L);
		dao.insertByBook(vo);
	}

	private static void testDeleteAll() {
		new OrderDao().DeleteAll();
	}

	private static void testAutoIncrementReset() {
		new OrderDao().autoIncrementReset();
	}

	private static void testDeleteAllByBook() {
		new OrderDao().DeleteAllByBook();
	}

	private static void testAutoIncrementResetByBook() {
		new OrderDao().autoIncrementResetByBook();
	}
}