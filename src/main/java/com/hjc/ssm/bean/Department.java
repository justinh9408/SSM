package com.hjc.ssm.bean;

public class Department {
    private Integer id;

    private String dptName;

    public Department() {
    }

    public Department(Integer id, String dptName) {
        this.id = id;
        this.dptName = dptName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDptName() {
        return dptName;
    }

    public void setDptName(String dptName) {
        this.dptName = dptName;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", dptName='" + dptName + '\'' +
                '}';
    }
}