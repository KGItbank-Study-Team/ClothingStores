package com.kgitbank.slimbear.logging;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
    
    public void controllerBeforeLog(JoinPoint joinPoint) {
        System.out.println("[로그] : 컨트롤러 로직 시작 전 : " + joinPoint.toShortString());
    }
    
}