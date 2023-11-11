package com.kgitbank.slimbear.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kgitbank.slimbear.vo.MemberCartVO;

@Service
public class OstSerivceImpl {

    private List<MemberCartVO> cartList = new ArrayList<>();

    // 생성자에서 초기 데이터베이스 조회
    public OstSerivceImpl() {
        initializeCart();
    }

    private void initializeCart() {
        // 데이터베이스에서 초기 장바구니 정보를 가져옴
        // 예시로 가상의 데이터를 추가
        for (int i = 0; i < 5; ++i) {
            MemberCartVO membercart = new MemberCartVO();
            membercart.setUid(i);
            membercart.setDesc("유해커의 후드티");
            membercart.setInfoo("입는순간 유해커가 되는 후드티");
            membercart.setQuantity(i);
            membercart.setAddprice(100);
            membercart.setPrice(45000);
            membercart.setBaedalprice(2500);
            membercart.setProductId(i);
            membercart.setTotalprice(membercart.getQuantity() * membercart.getPrice());
            membercart.setTotalprice(membercart.getQuantity() * membercart.getAddprice());

            cartList.add(membercart);
        }
    }

    public List<MemberCartVO> getCart() {
        return cartList;
    }
    @RequestMapping(value = "/deleteSelectedItems", method = RequestMethod.POST)
    @ResponseBody
    public List<MemberCartVO> deleteSelectedItems(List<Long> ctg_uid) {
        System.out.println("Received ctg_uid: " + ctg_uid);

        List<MemberCartVO> updatedCart = new ArrayList<>();

        // ctg_uid에 해당하는 상품들을 삭제하고, 업데이트된 장바구니 정보를 반환
        for (MemberCartVO cartItem : cartList) {
            if (!ctg_uid.contains(cartItem.getUid())) {
                updatedCart.add(cartItem);
            }
        }

        // 여기에서 삭제된 항목들에 대한 처리 추가
        // 데이터베이스에서도 삭제 작업을 수행해야 합니다.

        // 업데이트된 장바구니 정보를 반영
        cartList = updatedCart;

        return updatedCart;
    }

}

