package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_c_if_test;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_c_if_test = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_c_if_test.release();
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Login</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/home-style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/merch-style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/login-style.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/sign-up-style.css\">\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Doppio+One|Oxanium&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"hero\">\r\n");
      out.write("\r\n");
      out.write("            ");
      if (_jspx_meth_c_if_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("            <div class=\"form-box\">\r\n");
      out.write("                <div class=\"button-box\">\r\n");
      out.write("                    <div id=\"btn\"></div>\r\n");
      out.write("                    <button type=\"button\" class=\"toggle-btn\" onclick=\"loginuser()\">Beauty House</button>\r\n");
      out.write("                    <!--<button type=\"button\" class=\"toggle-btn\" onclick=\"loginadmin()\">Admin</button>-->\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"social-icons\">\r\n");
      out.write("                    <img src=\"img/logo.jpg\" alt=\"\">\r\n");
      out.write("                </div>\r\n");
      out.write("                <form id=\"login-user\" action=\"login\" method=\"post\" class=\"input-group\">\r\n");
      out.write("\r\n");
      out.write("                    <input type=\"text\" name=\"username\" value=\"\" class=\"input-field\" placeholder=\"Account\" required>\r\n");
      out.write("                    <input type=\"password\" name=\"password\" value=\"\" class=\"input-field\" placeholder=\"Password\" required>\r\n");
      out.write("                    <br/><br/><br/><br/>\r\n");
      out.write("                    <input type=\"submit\" class=\"submit-btn\" value=\"Login\">\r\n");
      out.write("                    <li class=\"items\" id=\"loginAd\">\r\n");
      out.write("                        <a href=\"index.jsp\">Cancel</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </form>\r\n");
      out.write("<!--                <form id=\"login-admin\" action=\"loginAdmin\" method = \"post\" class=\"input-group\">\r\n");
      out.write("                    <input type=\"text\" class=\"input-field\" name=\"username\" placeholder=\"Account\" required>\r\n");
      out.write("                    <input type=\"password\" class=\"input-field\" name=\"password\" placeholder=\"Password\" required>\r\n");
      out.write("                    <br/><br/>\r\n");
      out.write("                    <input type=\"submit\" class=\"submit-btn\" id=\"loginAd\" value=\"Login\">\r\n");
      out.write("                    <li class=\"items\" id=\"loginAd\">\r\n");
      out.write("                        <a href=\"index.jsp\">Cancel</a>\r\n");
      out.write("                    </li>\r\n");
      out.write("                </form>-->\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("        <script>\r\n");
      out.write("            var x = document.getElementById(\"login-user\");\r\n");
      out.write("            var y = document.getElementById(\"login-admin\");\r\n");
      out.write("            var z = document.getElementById(\"btn\");\r\n");
      out.write("\r\n");
      out.write("//            function loginadmin() {\r\n");
      out.write("//                x.style.left = \"-400px\";\r\n");
      out.write("//                y.style.left = \"50px\";\r\n");
      out.write("//                z.style.left = \"110px\";\r\n");
      out.write("//            }\r\n");
      out.write("            function loginuser() {\r\n");
      out.write("                x.style.left = \"50px\";\r\n");
      out.write("                y.style.left = \"450px\";\r\n");
      out.write("                z.style.left = \"0\";\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_if_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_if_0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _jspx_tagPool_c_if_test.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_if_0.setPageContext(_jspx_page_context);
    _jspx_th_c_if_0.setParent(null);
    _jspx_th_c_if_0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.error!=null}", java.lang.Boolean.class, (PageContext)_jspx_page_context, null)).booleanValue());
    int _jspx_eval_c_if_0 = _jspx_th_c_if_0.doStartTag();
    if (_jspx_eval_c_if_0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("                <div id=\"alert\" class=\"alert\">\r\n");
        out.write("                    <strong>");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${requestScope.error}", java.lang.String.class, (PageContext)_jspx_page_context, null));
        out.write("</strong>\r\n");
        out.write("                </div>\r\n");
        out.write("            ");
        int evalDoAfterBody = _jspx_th_c_if_0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_if_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
      return true;
    }
    _jspx_tagPool_c_if_test.reuse(_jspx_th_c_if_0);
    return false;
  }
}
