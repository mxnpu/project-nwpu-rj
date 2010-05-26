package com.goodfriend.util;

import java.util.Comparator;

import com.goodfriend.model.Blog;
import com.goodfriend.model.Statement;

/**
 * The comparator.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.25
 * @LastModifiedtime 2010.05.25
 */
public class ComparatorObject implements Comparator<Object> {

    /*
     * (non-Javadoc)
     * 
     * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
     */
    public int compare(Object o1, Object o2) {

	long t1 = 0;
	long t2 = 0;

	if (o1 instanceof Statement && o2 instanceof Statement) {
	    Comparator<Statement> stmtCompartor = new StatementComparator();

	    return stmtCompartor.compare((Statement) o1, (Statement) o2);
	}

	if (o1 instanceof Blog && o2 instanceof Blog) {
	    Comparator<Blog> blogCompartor = new BlogComparator();

	    return blogCompartor.compare((Blog) o1, (Blog) o2);
	}

	if (o1 instanceof Statement && o2 instanceof Blog) {
	    t1 = ((Statement) o1).getItem().getRecordTime().getTime();
	    t2 = ((Blog) o2).getItem().getRecordTime().getTime();
	} else {
	    t1 = ((Blog) o1).getItem().getRecordTime().getTime();
	    t2 = ((Statement) o2).getItem().getRecordTime().getTime();
	}
	if (t1 < t2) {
	    return 1;
	} else if (t1 > t2) {
	    return -1;
	} else {
	    return 0;
	}
    }

}
