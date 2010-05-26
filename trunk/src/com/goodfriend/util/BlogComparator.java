/**
 * 
 */
package com.goodfriend.util;

import java.util.Comparator;

import com.goodfriend.model.Blog;

/**
 * The comparator.
 * 
 * @author xurunhua
 * @CreateTime 2010.05.25
 * @LastModifiedtime 2010.05.25
 */
public class BlogComparator implements Comparator<Blog> {

    /* (non-Javadoc)
     * @see java.util.Comparator#compare(java.lang.Object, java.lang.Object)
     */
    public int compare(Blog o1, Blog o2) {
	if (o1.getItem().getRecordTime().getTime() < o2.getItem()
		.getRecordTime().getTime()) {
	    return 1;
	} else if (o1.getItem().getRecordTime().getTime() > o2.getItem()
		.getRecordTime().getTime()) {
	    return -1;
	} else {
	    return 0;
	}
    }

}
