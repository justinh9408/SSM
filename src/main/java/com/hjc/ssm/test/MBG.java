package com.hjc.ssm.test;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @Classname MBG
 * @Description TODO
 * @Date 2020-01-07 13:24
 * @Created by Justin
 */
public class MBG {

    public static void main(String[] args) throws Exception {
        List<String> warnings = new ArrayList<String>();
//        boolean overwrite = true;
        File configFile = new File("src/main/mbg.xml");///Users/Justin/IdeaProjects/mySpringMVC/src/main/resources/
        ConfigurationParser cp = new ConfigurationParser(warnings);
        Configuration config = cp.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(true);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        myBatisGenerator.generate(null);
    }
}
