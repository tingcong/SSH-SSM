package com.myssm.service;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
import com.myssm.bean.PreStudent;
import com.myssm.mapper.PreStudentMapper;

@Transactional
@Service
public class MngStuService {

	@Autowired
	private PreStudentMapper preStudentMapper;

	// 获取潜在学员表
	public List<PreStudent> getListStudent() {
		PreStudent stu = new PreStudent();
		stu.setState(1);
		return preStudentMapper.select(stu);
	}

	// 根据id获取一个潜在学员
	public PreStudent getStudent(String id) {
		PreStudent stu = new PreStudent();
		stu.setId(Long.parseLong(id));
		return preStudentMapper.selectOne(stu);
	}

	// 添加一个潜在学员
	public void InsertStu(PreStudent stu) {
		stu.setCreatetime(new Date());
		stu.setState(1);
		preStudentMapper.insert(stu);
	}

	// 批量删除潜在学员
	public void DelStu(List<String> ids) {
		Example exm = new Example(PreStudent.class);
		Criteria crt = exm.createCriteria();
		crt.andIn("id", ids);
		preStudentMapper.deleteByExample(exm);
	}

	// 更新一个潜在学员
	public void UpdateStu(PreStudent stu) {
		stu.setState(1);
		preStudentMapper.updateByPrimaryKeySelective(stu);
	}

}
