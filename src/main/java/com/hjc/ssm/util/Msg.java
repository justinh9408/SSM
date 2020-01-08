package com.hjc.ssm.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @Classname Msg
 * @Description TODO
 * @Date 2020-01-08 14:53
 * @Created by Justin
 */
public class Msg {

    private Integer code;

    private String message;

    private Map<String, Object> data = new HashMap<String, Object>();

    public static Msg success(){
        Msg m = new Msg();
        m.setCode(100);
        m.setMessage("success");
        return m;
    }

    public static Msg fail(){
        Msg m = new Msg();
        m.setCode(200);
        m.setMessage("failure");
        return m;
    }



    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public Msg add(String key, Object content) {
        data.put(key, content);
        return this;
    }
}
