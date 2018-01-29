<#ftl output_format="HTML">
<#include "/WEB-INF/pages/inc/header.ftl"/>
<title><@s.text name="login.title"/></title>
<#assign currentMenu = "account"/>
<#include "/WEB-INF/pages/inc/menu.ftl"/>
<#include "/WEB-INF/pages/macros/forms.ftl">


  <div class="headline text-center">
    <h3><@s.text name="login.title"/></h3>
    <p><@s.text name="login.intro"><@s.param>${admin.email}</@s.param></@s.text></p>
  </div>

<#include "/WEB-INF/pages/inc/footer.ftl"/>