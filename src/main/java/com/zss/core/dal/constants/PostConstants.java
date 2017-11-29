package com.zss.core.dal.constants;

public class PostConstants{
  private PostConstants(){
  }

  /* 文章类型 */
  public static final String TYPE_POST = "post";
  public static final String TYPE_PAGE = "page";
  /* 文章评论状态 */
  public static final String COMMENT_OPEN = "open";
  public static final String COMMENT_CLOSE = "close";
  /* 文章状态,发布、回收站 */
  public static final String POST_PUBLISH = "publish";
  public static final String POST_SECRET = "secret";
  public static final String POST_TRASH = "trash";
  
  /* 所有创建者 */
  public static final Integer POST_CREATOR_ALL = 0;

  /**
   * 默认文章的parent
   */
  public static final Integer DEFAULT_PARENT = 0;

  /* 文章摘要长度 (此为post表中description的varchar(350)) */
  public static final int EXCERPT_LENGTH = 350;

  /**
   * 初始化postId
   */
  public static final int INIT_POST_ID = 5;

}