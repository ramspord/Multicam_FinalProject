package com.example.demo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRepositoryImpl implements UserRepository {
    @Autowired
    private SqlSession sqlSession;

    private static final String NAMESPACE = "com.example.demo.dao.MemberDAO"; 

    // 아이디 중복 체크
    @Override
    public int idCheck(String id) {
        int cnt = sqlSession.selectOne(NAMESPACE+".idCheck", id);
        return cnt;
    }
}