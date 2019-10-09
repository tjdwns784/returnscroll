package com.spring.returnscroll.provider;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.UsersDao;

public class LoginService implements UserDetailsService {
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	UsersDao usersDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", username);
		
		Map<String, Object> result = usersDao.login(map);
		
		CustomUserDetail user = new CustomUserDetail();
		user.setUsername("a");
		user.setPassword((String) result.get("upw"));
		user.setEnabled(true);
		return user;
	}
}
