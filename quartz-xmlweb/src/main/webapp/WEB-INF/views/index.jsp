<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Quartz Web</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

</head>

<body>
<div class="wrapper">

    <div class="content-wrapper">
        <section class="content-header">
            <div class="box" style="margin-bottom: 0px">
                <div class="box-header">
                    <h3 class="box-title">任务列表</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                    <div>
                        <a href="/">刷新</a>
                        <br>
                        <span>当前时间 ${scheduleInfo.currentTime}</span>
                        <br>
                        <span>当前有 ${scheduleInfo.jobCount} 个任务在执行</span>
                        <br>
                        <br>
                    </div>
                    <div>
                        <div>计划中的任务列表</div>
                    </div>
                    <div>
                        <table id="scheduleJobList" border="1">
                            <thead>
                            <tr>
                                <th>任务名称</th>
                                <th>任务分组</th>
                                <th>任务状态</th>
                                <th>时间表达式</th>
                                <th>同时执行</th>
                                <th>描述</th>
                                <th>上次执行时间</th>
                                <th>下次执行时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="listValue" items="${scheduleJobList}">
                                <tr>
                                    <td><c:out value="${listValue.jobName}"/></td>
                                    <td><c:out value="${listValue.jobGroup}"/></td>
                                    <td><c:out value="${listValue.status}"/></td>
                                    <td><c:out value="${listValue.cronExpression}"/></td>
                                    <td><c:out value="${listValue.isConcurrent}"/></td>
                                    <td><c:out value="${listValue.description}"/></td>
                                    <td><c:out value="${listValue.previousFireTime}"/></td>
                                    <td><c:out value="${listValue.nextFireTime}"/></td>
                                    <td><input type="button" value="暂停"
                                               onclick="location.href='/pause?triggerName=${listValue.triggerName}&triggerGroup=${listValue.triggerGroup}'"/>
                                        <input type="button" value="恢复"
                                               onclick="location.href='/resume?triggerName=${listValue.triggerName}&triggerGroup=${listValue.triggerGroup}'"/>
                                        <input type="button" value="删除"
                                               onclick="location.href='/delete?triggerName=${listValue.triggerName}&triggerGroup=${listValue.triggerGroup}'"/>
                                        <input type="button" value="运行一次"
                                               onclick="location.href='/runOnce?triggerName=${listValue.triggerName}&triggerGroup=${listValue.triggerGroup}'"/>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <br/>
                    </div>

                    <div>
                        <div>正在执行的任务</div>
                        <div>

                            <table id="executingJobList" border="1">
                                <thead>
                                <tr>
                                    <th>任务名称</th>
                                    <th>任务分组</th>
                                    <th>触发器名称</th>
                                    <th>触发器分组</th>
                                    <th>任务状态</th>
                                    <th>时间表达式</th>
                                    <th>开始执行时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="listValue" items="${executingJobList}">
                                    <tr>
                                        <td><c:out value="${listValue.jobName}"/></td>
                                        <td><c:out value="${listValue.jobGroup}"/></td>
                                        <td><c:out value="${listValue.triggerName}"/></td>
                                        <td><c:out value="${listValue.triggerGroup}"/></td>
                                        <td><c:out value="${listValue.status}"/></td>
                                        <td><c:out value="${listValue.cronExpression}"/></td>
                                        <td><c:out value="${listValue.gmtCreate}"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<!-- REQUIRED JS SCRIPTS -->
<script>
</script>
</body>
</html>


