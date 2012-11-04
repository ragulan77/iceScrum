<%@ page import="org.icescrum.core.domain.Story; org.icescrum.core.domain.Task; org.icescrum.core.utils.BundleUtils" %>
<div style="float:right; padding: 10px; padding-top: 10px">
    <button onclick="NotesToText('#sprintNotes','.copyNotes');">${message(code:'is.ui.notes.copy.as.text')}</button>
    <button onclick="NotesToHtml('#sprintNotes','.copyNotes');">${message(code:'is.ui.notes.copy.as.html')}</button>
</div>
<div id="sprintNotes" style="padding: 10px;">
    <h1>${sprint.deliveredVersion ? sprint.deliveredVersion + ' - ' : ''}${sprint.parentRelease.name} - ${message(code:'is.sprint')} ${sprint.orderNumber}</h1>
    <g:if test="${tasks}">
        <h2>${message(code: BundleUtils.taskTypes[Task.TYPE_URGENT])}</h2>
        <ul><g:each in="${tasks}" var="task">
                <li><a class="scrum-link" href="${createLink(absolute: true, mapping: "shortURLTASK", params: [product: sprint.parentProduct.pkey], id: task.uid)}">${message(code:'is.ui.notes.story', args:[sprint.parentProduct.pkey])}${task.uid}</a> - ${task.name}</li>
            </g:each></ul>
    </g:if>
    <g:if test="${defectStories}">
        <h2>${message(code: BundleUtils.storyTypes[Story.TYPE_DEFECT])}</h2>
        <ul><g:each in="${defectStories}" var="story">
                <li><a class="scrum-link" href="${createLink(absolute: true, mapping: "shortURL", params: [product: sprint.parentProduct.pkey], id: story.uid)}">${message(code:'is.ui.notes.story', args:[sprint.parentProduct.pkey])}${story.uid}</a> - ${story.name}</li>
            </g:each></ul>
    </g:if>
    <g:if test="${technicalStories}">
        <h2>${message(code: BundleUtils.storyTypes[Story.TYPE_TECHNICAL_STORY])}</h2>
        <ul><g:each in="${technicalStories}" var="story">
                <li><a class="scrum-link" href="${createLink(absolute: true, mapping: "shortURL", params: [product: sprint.parentProduct.pkey], id: story.uid)}">${message(code:'is.ui.notes.story', args:[sprint.parentProduct.pkey])}${story.uid}</a> - ${story.name}</li>
            </g:each></ul>
    </g:if>
    <g:if test="${userStories}">
        <h2>${message(code: BundleUtils.storyTypes[Story.TYPE_USER_STORY])}</h2>
        <ul><g:each in="${userStories}" var="story">
                <li><a class="scrum-link" href="${createLink(absolute: true, mapping: "shortURL", params: [product: sprint.parentProduct.pkey], id: story.uid)}">${message(code:'is.ui.notes.story', args:[sprint.parentProduct.pkey])}${story.uid}</a> - ${story.name}</li>
            </g:each></ul>
    </g:if>
</div>
<h1 class="copyNotes" style="display: none;">${message(code:'is.ui.sprintPlan.notes.copyTo')}</h1>
<textarea class="copyNotes" data-selectall="true" rows="20"></textarea>