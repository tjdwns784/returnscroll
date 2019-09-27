package com.spring.returnscroll.Service;

import java.security.MessageDigest;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.UsersDao;

@Service
public class MemberService {

	@Autowired
	UsersDao usersDao;
	
	public static String encrypt(String planText) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(planText.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	
	// 아이디 찾기
	public String get_searchId(String uname, String phone) {
		String result = "";

			try {
				result = usersDao.searchId(uname, phone);
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println(result);
			return result;
		}

	// 패스워드 찾기 이메일 발송
	public void mailSendWithPassword(String uid, String email) {
		String result = usersDao.searchPassword(uid, email);
		
		if(!result.equals("")) { // 찾기 성공
			Mailer m = new Mailer();
			m.sendMail(email, "비밀번호 안내", "[1234]로 변경되었습니다.<br>접속 후 비밀번호를 변경해주세요.", new SMTPAuthenticator());
		} else { // 비밀번호 찾기 실패
			
		}
		
		System.out.println(result);
	}

	public int join(Map<String, Object> map) {
		return usersDao.join(map);

	}

	public String login(Map<String, Object> map) {
		return usersDao.login(map);
	}
	
	public int userUpdate(Map<String, Object> map) {
		return usersDao.userUpdate(map);
	}
	
	public int userDelete(Map<String, Object> map) {
		return usersDao.userDelete(map);
	}
	
	public String idDup(String id) {
		return usersDao.dup(id);

	}

	public String nickDup(String nick) {
		return usersDao.dupNick(nick);

	}

	public String emailDup(String email) {
		return usersDao.dupEmail(email);

	}

	// 채팅에 멤버초대하는 거임. 
	public Map<String, String> chatInvite(String uid) {
		return usersDao.chatInvite(uid);
	}
	public String userNick(String uid) {
		return usersDao.userNick(uid);
	}

}