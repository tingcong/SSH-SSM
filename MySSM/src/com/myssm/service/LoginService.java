package com.myssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.myssm.bean.Employee;
import com.myssm.mapper.EmployeeMapper;

@Transactional
@Service
public class LoginService {

	@Autowired
	private EmployeeMapper employeeMapper;

	// �����û���/�����ȡһ���û�
	public Employee getEmployee(String username, String password) {
		Employee employee = new Employee();
		employee.setUsername(username);
		employee.setPassword(password);
		return employeeMapper.selectOne(employee);
	}

}
