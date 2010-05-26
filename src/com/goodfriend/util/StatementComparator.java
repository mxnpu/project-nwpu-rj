package com.goodfriend.util;

import java.util.Comparator;

import com.goodfriend.model.Statement;

/**
 * The comparator.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.25
 * @LastModifiedtime 2010.05.25
 */
public class StatementComparator implements Comparator<Statement> {
    
    /* (non-Javadoc)
     * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
     */
    public int compare(Statement stmt1, Statement stmt2) {
	if (stmt1.getItem().getRecordTime().getTime() < stmt2.getItem()
		.getRecordTime().getTime()) {
	    return 1;
	} else if (stmt1.getItem().getRecordTime().getTime() > stmt2.getItem()
		.getRecordTime().getTime()) {
	    return -1;
	} else {
	    return 0;
	}
    }

}
