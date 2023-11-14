package com.kgitbank.slimbear.logging;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Aspect
@Component
@Slf4j
public class LoggingAspect {
    
    public void controllerBeforeLog(JoinPoint joinPoint) {
        log.info("[로그] : " + joinPoint.toShortString());
    }
    
}