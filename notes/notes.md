original code for adding a new assignment and/or creating a new assignment from the cohort show page


<%= form_for @cohort_assignment do |field| %>
  <h3>Create an Assignment for <%=@cohort.name%></h3>
  <%= field.fields_for :assignment do |f| %>
    <%= f.label :name %><br>
    <%= f.text_field :name %><br>

    <%= f.label :description %><br>
    <%= f.text_area :description %><br>

    <%= f.label :time %><br>
    <%= f.number_field :time %><br>

    <%= f.label :priority %><br>
    <%= f.number_field :priority %><br>
    <%= f.hidden_field :cohort_id, :value => @cohort.id %>
    <% end %>

<!--  -->


  <%= field.submit "Submit"%>
  <%end%>

      <h3> Assign Existing Assignment </h3>
    <%= field.collection_select :id, Assignment.all, :id, :name %>
