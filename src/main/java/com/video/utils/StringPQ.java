package com.video.utils;

import java.util.Random;

public class StringPQ {

    private static String query_type[] = new String[]{"default","audit","user"};

    public static String getQuerytype(){
        return  query_type[new Random().nextInt(query_type.length)];
    }
}
