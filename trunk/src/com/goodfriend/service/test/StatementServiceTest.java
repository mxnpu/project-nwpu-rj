/**
 * 
 */
package com.goodfriend.service.test;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.goodfriend.model.Statement;
import com.goodfriend.model.User;
import com.goodfriend.service.IStatementService;
import com.goodfriend.service.IUserService;

/**
 * 
 * The JUnit test case for the statement service  module.
 * 
 * @author xurunhua
 * @time 2010.05.15
 */
public class StatementServiceTest {

    private IStatementService statementService;
    private IUserService userService;

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
	ApplicationContext ctx = new ClassPathXmlApplicationContext(
		"beans-test.xml");
	statementService = (IStatementService) ctx.getBean("statementService");
	userService = (IUserService) ctx.getBean("userService");
    }

    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
	statementService = null;
	userService = null;
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.StatementService#addStatement(com.goodfriend.model.Statement, java.lang.Integer)}
     * .
     */
    @Test
    public void testAddStatement() {
	User user = userService.getUser("xiaoxu");
	Statement statement = new Statement();
	for (int i = 0; i < 5; i++) {
	    statement.setContent("第" + i + "个状态信息");
	    statementService.addStatement(statement, user.getIdUser());
	}

    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.StatementService#deleteStatement(com.goodfriend.model.Statement)}
     * .
     */
    @Test
    public void testDeleteStatement() {
	Statement statement = statementService.getStatement(1);
	statementService.deleteStatement(statement);
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.StatementService#getStatement(java.lang.Integer)}
     * .
     */
    @Test
    public void testGetStatement() {
	Statement statement = statementService.getStatement(1);
	System.out.print(statement.getContent());
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.StatementService#getStatements(java.lang.String)}
     * .
     */
    @Test
    public void testGetStatements() {
	List<Statement> statements = statementService.getStatements(1);
	for (Statement temp : statements) {
	    String content = temp.getContent();
	    System.out.println(content);
	    System.out.println(temp.getItem().getUser().getUserName());
	}
    }

    /**
     * Test method for
     * {@link com.goodfriend.service.impl.StatementService#updateStatement(com.goodfriend.model.Statement)}
     * .
     */
    @Test
    public void testUpdateStatement() {
	for (int i = 1; i < 6; i++) {
	    Statement s = statementService.getStatement(i);
	    s.setContent("xurunhua第" + i + "条状态信息");
	    statementService.updateStatement(s);
	}
    }
}
