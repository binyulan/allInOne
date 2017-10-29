package com.auuid.security;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RoleService {
	@Resource
	RoleDao roleDao;
	
	@Transactional
	public List<Role> getAll() {
		return roleDao.getAll();
	}
}
