old student show code 


<!-- Assignments -->
<h2>Assignments</h2>
<table class="assignments-table">
<tr>
 <th>Name</th>
 <th>Description</th>
 <th>Time</th>
 <th>Priority</th>
 <th>Status</th>
 <th></th>
</tr>

 <% @student.assignments.each do |assignment| %>
 <tr>
  <td><%= assignment.name %></td>
  <td><%= assignment.description %></td>
  <td><%= assignment.time %></td>
  <td><%= assignment.priority %></td>  
  <td><%= @student.assignment_status(assignment) %></td>
  <td><%= link_to 'Done', complete_assignment_path(:assignment =>{:assignment_id => assignment.id}) %></td>

  <!-- <%= @student.assignment_status(assignment) %> -->
 </tr>
 <% end %>

</table>

<h2>Tasks</h2>
<table>
<tr>
 <th>Name</th>
 <th>Description</th>
 <th>Time</th>
 <th>Priority</th>
 <th>Status</th>
 <th></th>
</tr>

 <% @student.tasks.each do |task| %>
 <tr>
  <td><%= task.name %></td>
  <td><%= task.description %></td>
  <td><%= task.priority%></td>
  <td><%= task.time %></td>
  <td><%= task.status %></td>
  <td><%= link_to 'Done', complete_task_path(:task =>{:task_id => task.id}) %></td>
 </tr>
<% end %>
</table>