<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <div class="manage-content">
        <h3><li><a href="/admin.content.do?action=create&categoryId=${categoryId}">Добавить новый контент</a></li></h3>
        <c:set var="contentLength" value="${fn:length(contentList)}"/>
        <c:choose>
            <c:when test="${contentLength > 0}">
                <c:forEach items="${contentList}" var="content">
                    <c:if test="${content.type eq 'TABLE'}">
                        <table class="content-sheet">${content.htmlTable}</table>
                        <li><a href="/admin.content.do?action=edit&contentType=TABLE&contentId=${content.contentId}&categoryId=${categoryId}">Редактировать</a></li>
                        <li><a href="/admin.content.do?action=delete&categoryId=${categoryId}&contentId=${content.contentId}&contentType=TABLE">Удалить</a></li>
                    </c:if>
                    <c:if test="${content.type eq 'TEXT'}">
                      <li> <p class="content-text"> ${content.text} </p></li>
                        <li><a href="/admin.content.do?action=edit&contentType=TEXT&contentId=${content.contentId}&categoryId=${categoryId}">Редактировать</a></li>
                        <li><a href="/admin.content.do?action=delete&categoryId=${categoryId}&contentId=${content.contentId}&contentType=TEXT">Удалить</a></li>
                    </c:if>
                    <c:if test="${content.type eq 'IMAGE'}">
                        <li><img src="${content.thumbImagePath}" alt="image not found"/></li>
                        <li><a href="/admin.content.do?action=edit&contentType=IMAGE&contentId=${content.contentId}&categoryId=${categoryId}">Редактировать</a></li>
                        <li><a href="/admin.content.do?action=delete&categoryId=${categoryId}&contentId=${content.contentId}&contentType=IMAGE&path=${content.imageFilePath}&thumbPath=${content.thumbImageFilePath}">Удалить</a></li>
                    </c:if>
                    <hr/>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <h2>You can add content using admin page.</h2>
            </c:otherwise>
        </c:choose>
    </div>
