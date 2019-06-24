package com.chenzhen.budget.util;

public class RestResponse<T> {
    private T payload;
    private boolean success;
    private String msg;
    private int code = -1;
    private long timestamp;


    public static RestResponse ok() {
        return new RestResponse(true);
    }

    public static <T> RestResponse ok(T payload) {
        return new RestResponse(true, payload);
    }

    public static <T> RestResponse ok(int code) {
        return new RestResponse(true, null, code);
    }

    public static <T> RestResponse ok(T payload, int code) {
        return new RestResponse(true, payload, code);
    }

    public static <T> RestResponse fail() {
        return new RestResponse(false);
    }

    public static RestResponse fail(String msg) {
        return new RestResponse(false, msg);
    }

    public static RestResponse fail(int code) {
        return new RestResponse(false, null, code);
    }

    public static RestResponse fail(int code, String msg) {
        return new RestResponse(false, msg, code);
    }



    public RestResponse() {
        this.timestamp = Commons.current();
    }

    public RestResponse(boolean success) {
        this.timestamp = Commons.current();
        this.success = success;
    }

    public RestResponse(boolean success, T payload) {
        this.timestamp = Commons.current();
        this.success = success;
        this.payload = payload;
    }

    public RestResponse(boolean success, T payload, int code) {
        this.timestamp = Commons.current();
        this.success = success;
        this.payload = payload;
        this.code = code;
    }

    public RestResponse(boolean success, String msg) {
        this.timestamp = Commons.current();
        this.success = success;
        this.msg = msg;
    }

    public RestResponse(boolean success, String msg, int code) {
        this.timestamp = Commons.current();
        this.success = success;
        this.msg = msg;
        this.code = code;
    }


    public T getPayload() {
        return payload;
    }

    public void setPayload(T payload) {
        this.payload = payload;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

}
