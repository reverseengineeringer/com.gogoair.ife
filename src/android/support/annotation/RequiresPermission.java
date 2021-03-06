package android.support.annotation;

import java.lang.annotation.Annotation;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.CLASS)
@Target({java.lang.annotation.ElementType.ANNOTATION_TYPE, java.lang.annotation.ElementType.METHOD, java.lang.annotation.ElementType.CONSTRUCTOR, java.lang.annotation.ElementType.FIELD})
public @interface RequiresPermission
{
  String[] allOf() default {};
  
  String[] anyOf() default {};
  
  boolean conditional() default false;
  
  String value() default "";
  
  @Target({java.lang.annotation.ElementType.FIELD})
  public static @interface Read
  {
    RequiresPermission value();
  }
  
  @Target({java.lang.annotation.ElementType.FIELD})
  public static @interface Write
  {
    RequiresPermission value();
  }
}

/* Location:
 * Qualified Name:     android.support.annotation.RequiresPermission
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */