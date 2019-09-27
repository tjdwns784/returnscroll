package com.spring.returnscroll.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.returnscroll.Dao.UsersDao;

@Service
public class MemberService {

	@Autowired
	UsersDao usersDao;


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
		String name = usersDao.mailId(uid, email);
		
		String key = "";

		// 임시 비밀번호 생성 (알파벳 4자리 + 숫자 4자리)
		key = getRandomPassword(4);

		// 생성된 비밀번호 암호화
		String encryptKey = "";
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] byteValue = md5.digest(key.getBytes());

			Base64 base64EnDe = new Base64();

			encryptKey = base64EnDe.encodeToString(byteValue).replaceAll("\r\n", "");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		// 암호화된 비밀번호로 DB 값 변경
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uid", uid);
		map.put("upw", encryptKey);
		usersDao.passwordUpdate(map);

		// 이메일 전송
		String htmlStr = "<h2>안녕하세요 '" + name + "' 님</h2><br><br>" + "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key
				+ "'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href=\"http://localhost:8080/returnscroll/index\">홈페이지 접속 링크 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다.)";
		if (!result.equals("")) { // 찾기 성공
			Mailer m = new Mailer();
			m.sendMail(email, "비밀번호 안내", htmlStr, new SMTPAuthenticator());

		} else { // 비밀번호 찾기 실패

		}

		System.out.println(result);
	}
	
	// 랜덤 임시 비밀번호 생성
	public String getRandomPassword(int len) { 
		char[] charSet = new char[] { 
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
				'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
				'u', 'v', 'w', 'x', 'y', 'z',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 
				'U', 'V', 'W', 'X', 'Y', 'Z'
				}; 
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
		for (int i = 0; i < len; i++) { 
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet[idx]); 
		}
		
		char[] charSet2 = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
		}; 
		int idx2 = 0; 
		for (int i = 0; i < len; i++) { 
			idx2 = (int) (charSet2.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
			sb.append(charSet2[idx2]); 
		}
		
		
		
		return sb.toString(); 
	}
	
	// 비밀번호 암호화
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
	
	// 회원가입
	public int join(Map<String, Object> map) {
		return usersDao.join(map);

	}
	
	// 로그인
	public String login(Map<String, Object> map) {
		return usersDao.login(map);
	}
	
	// 회원정보수정
	public int userUpdate(Map<String, Object> map) {
		return usersDao.userUpdate(map);
	}
	
	// 회원탈퇴
	public int userDelete(Map<String, Object> map) {
		return usersDao.userDelete(map);
	}
	
	// ID 중복검사
	public String idDup(String id) {
		return usersDao.dup(id);

	}
	
	// 닉네임 중복검사
	public String nickDup(String nick) {
		return usersDao.dupNick(nick);

	}
	
	// EMAIL 중복검사
	public String emailDup(String email) {
		return usersDao.dupEmail(email);

	}

	// 채팅창 멤버초대
	public Map<String, String> chatInvite(String uid) {
		return usersDao.chatInvite(uid);
	}
	public String userNick(String uid) {
		return usersDao.userNick(uid);
	}

}