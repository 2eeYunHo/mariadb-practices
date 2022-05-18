package hr.main;

import java.util.List;
import java.util.Scanner;

import hr.dao.EmployeeDao;
import hr.vo.EmployeeVo;

public class HRMain02 {

	public static void main(String[] args) {
		Scanner scanner= new Scanner(System.in);
		System.out.println("salary[min max] : ");
		int minSalary = scanner.nextInt();
		int maxSalary = scanner.nextInt();
		
		EmployeeDao dao = new EmployeeDao();
		List<EmployeeVo> result  = dao.findBySalary(minSalary, maxSalary);
		//no:firstName : lastName : salary
		for(EmployeeVo vo : result) {
			System.out.println(vo.getSalary() + ":" 
						     + vo.getFirstName() + ":" 
						     + vo.getLastName() + ":" 
						     + vo.getNo());
		}
		//order desc don limit
		scanner.close();
	}

}
