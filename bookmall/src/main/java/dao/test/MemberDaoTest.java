package dao.test;

import java.util.List;

import dao.MemberDao;
import vo.MemberVo;

public class MemberDaoTest {

	public static void main(String[] args) {
		testInsert();
		
	}
	
	private static void testInsert() {
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		
		vo.setName("둘리");
		vo.setPassword("123456");
		vo.setPhoneNumber("010-1234-5678");
		vo.setEmail("dooly@hanmail.net");
		dao.insert(vo);
		
		vo.setName("또치");
		vo.setPassword("777775");
		vo.setPhoneNumber("010-4444-4444");
		vo.setEmail("ddoch@gmail.com");
		dao.insert(vo);
		
		vo.setName("마이콜");
		vo.setPassword("111111");
		vo.setPhoneNumber("010-7777-7777");
		vo.setEmail("mycall@gmail.com");
		dao.insert(vo);
		
	}
	
	private static void testFindAll() {
		List<MemberVo> list = new MemberDao().findAll();
		for(MemberVo vo : list)
			System.out.println(vo);
	}
	
	private static void testDeleteAll() {
		new MemberDao().DeleteAll();
	}
	
	private static void testAutoIncrementReset() {
		new MemberDao().autoIncrementReset();
	}
}