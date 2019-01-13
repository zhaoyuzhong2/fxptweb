package com.fxptw.util;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
@Component
public class Scheduler {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    /**
     * 定时更新用户的逾期未服务的订单,5分钟执行一次
     */
    @Scheduled(cron="0 */5 * * * ?")
    public void updateOrderStatus() {
        //System.out.println("111111111111122222222222");

    }





}
