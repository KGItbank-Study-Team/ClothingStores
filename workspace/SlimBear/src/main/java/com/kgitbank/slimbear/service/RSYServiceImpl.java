package com.kgitbank.slimbear.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.kgitbank.slimbear.dao.CategoryDAO;
import com.kgitbank.slimbear.dao.MemberDAO;
import com.kgitbank.slimbear.dao.ProductDAO;
import com.kgitbank.slimbear.dto.CategoryDTO;
import com.kgitbank.slimbear.dto.MemberDTO;
import com.kgitbank.slimbear.dto.ProductDTO;

@Service
@PropertySource("classpath:gmail.properties")
public class RSYServiceImpl {
	@Autowired
	private ProductDAO prodDAO;
	@Autowired
	private CategoryDAO ctgDAO;
	@Autowired
	private MemberDAO memDAO;
	
	//상품목록 카테고리별 출력 (페이징,정렬 완료)
	public List<ProductDTO> getProductListByCategory(long category, String order, int currentPage, Integer offset, Integer pageSize) {
	    if (order == null) {
	        order = "";
	    }	    
	    offset = (currentPage - 1) * pageSize;
	    
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("ctg_uid", category);
	    paramMap.put("order", order);
	    paramMap.put("offset", offset);
	    paramMap.put("pageSize", pageSize);
	    
	    System.out.println(paramMap);

	    //가격순 정렬
	    switch (order) {
	        case "PRICE_ASC":
	            return prodDAO.getProductByCategoryOrderByPrice(paramMap);
			case "PRICE_DESC":
				return prodDAO.getProductByCategoryOrderByPriceDesc(paramMap);
			default:
				return prodDAO.getProductByCategory(paramMap);
		}
	}
	
	public int getTotalItems(long category) {
		int prod = prodDAO.selectTotalItems(category);
        return prod; // 카테고리 내 총 상품 수
    }	
	public CategoryDTO getCategoryByUid(long category){
		CategoryDTO ctg = ctgDAO.getCategoryByUid(category);
		return ctg; // 카테고리 가져오기 (uid기반)
	}	
	public List<CategoryDTO> getSubCategoryListByTopCtgUid(long category) {
		List<CategoryDTO> subCtg = ctgDAO.getSubCategoryListByTopCtgUid(category);
		return subCtg;// 하위 카테고리 가져오기 (상위 카테고리 기반)
	}
	
	//아이디찾기
	public MemberDTO findId(String name, String email, String phone) {
        List<MemberDTO> memberList = memDAO.getMemberList();
        for (MemberDTO member : memberList) {
            if (member.getName().equals(name) &&
                    (member.getEmail().equals(email) || member.getPhone().equals(phone))) {
                return member;
            }
        }        
        return null;
    }
	
	//비밀번호찾기
		public MemberDTO findPassword(String name, String id, String email, String phone) {
	        List<MemberDTO> memberList = memDAO.getMemberList();
	        for (MemberDTO member : memberList) {
	            if (member.getName().equals(name) &&
	            		(member.getId().equals(id)) &&
	                    	(member.getEmail().equals(email) || member.getPhone().equals(phone))) {
	                return member;
	            }
	        }        
	        return null;
	    }
		
		//이메일 발송
		@Value("${spring.mail.username}")
	    private String senderEmail;

	    @Value("${spring.mail.password}")
	    private String senderPassword;

	    public String sendEmail(String email, String subject, String content) throws MessagingException {
	        // 이메일 설정
	        Properties props = new Properties();
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");

	        // 세션 생성 및 인증
	        Session session = Session.getInstance(props, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(senderEmail, senderPassword);
	            }
	        });

	        // 메시지 생성
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(senderEmail));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	        message.setSubject(subject);
	        message.setText(content);

	        // 메일 발송
	        Transport.send(message);
	        return "Email sent successfully!";
	    }
}
