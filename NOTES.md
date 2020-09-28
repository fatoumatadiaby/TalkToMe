user

- User Model + Controller + routes
    - User
     first_name
     last_name
     email
     username
     password_digest

- Sessions Controller

Get Routes
- Get /login to: sessions new
- Post /login to: sessions create

- Get /signup to: users new
- Post /signup to: users create

- Get /users/profile to: users home

- Delete /logout to sessions destroy


scope methods
- 



             <!-- static links-->
      <li><%= link_to "Home", root_path %></li> 
      <li><%=link_to "About", about_path%></li>
      <li><%=link_to "Resources", resource_path%></li>
              <!--logged in and logged out -->
      <% unless logged_in? %>
          <li><%=link_to "Login", login_path%></li>
          <li><%=link_to "Signup", signup_path%></li>
      <% else%>
          <li><%=link_to "Profile", user_profile_path(current_user)%></li>
          <li><%=link_to "My Blogs", user_blog_path %></li>
          <li><%=link_to "My Resources",user_resource_path%></li>
          <li><%=link_to "Blogs", blogs_path %></li>
          <li><%=link_to "Logout", logout_path, method: "delete"%></li>
          <li><%=link_to "Create Blog", new_user_blog_path(current_user)%></li>
          <li><%=link_to "Add Resource", new_user_resource_path(current_user)%></li>

      <% end%>

      <%= link_to "Log In", login_path %>
  <%= link_to "signup", signup_path %>
   <%= link_to "resources", resources_path %>
   <div>
        <%=link_to "Logout", logout_path, method: "delete"%>
    </div>

<--------------->
     <% if session[:user_id] %>
  <h1><%= @user.name %></h1>
  <h2>Email: <%= @user.email %></h2>
  <h2>Facebook UID: <%= @user.uid %></h2>
  <img src="<%= @user.image %>">
 <% else %>

 <-------------->

 <h1>Signup</h1>

<%= form_for @user do |f| %>
 
 <div>
     <%= f.label :name%>
     <%= f.text_field :name%>
 </div>
 <div>
     <%= f.label :email%>
     <%= f.text_field :email%>
 </div>
 
 <div>
     <%= f.label :username%>
     <%= f.text_field :username%>
 </div>
 <div>
     <%= f.label :password%>
     <%= f.password_field :password%>
 </div>
     <%= f.label :password_confirmation %>
    <%= f.password_field :password_confirmation %>
 <div></div>
      <%=f.submit "Signup"%>
 
 <%end %>
  <%= link_to "Facebook Signup", '../auth/facebook' %>
   

   <-------------->
    <-------------->
     <-------------->

     <%= form_for  resource do |f| %>
  <div>
    <%= f.label :disorder %>
    <label>
         <input name="resource.disorder" type="radio" />
         <span>Anxiety Disorder</span>
    </label>
    <label>
         <input name="resource.disorder" type="radio" />
         <span>Obsessive-Compulsive Disorder</span>
    </label>
    <label>
         <input name="resource.disorder" type="radio" />
         <span>Eating Disorder</span>
    </label>
    <label>
         <input name="resource.disorder"  type="radio" />
         <span>Post-Traumatic Stress Disorder</span>
    </label>
    <label>
         <input name="resource.disorder"  type="radio" />
         <span>Depression Disorder</span>
    </label>
    <label>
         <input name="resource.disorder" type="radio" />
         <span>Attention Deficit Hyperactivity Disorder</span>
    </label>
  </div><br>
  <div>
    <%= f.label :category %> <br>
     <label>
         <input name="resource.category" type="radio" />
         <span>Book</span>
    </label>
      <label>
         <input name="resource.category" type="radio" />
         <span>Video</span>
    </label>
      <label>
         <input name="resource.category" type="radio" />
         <span>Article</span>
    </label>
  </div><br>
  <div>
    <%= f.label :resource_link %>
    <%= f.text_field :resource_link %>
  </div><br>

  <%= f.submit button_name %>
<% end %>
 <p>
     

     //  <%if  current_user %> 
  <%= link_to "Edit Post", edit_post_path(@post) %>
<%= link_to "Delete Post", post_path(@post), method: :delete %>
<%else%>
 <%= link_to "view all post", post_path(@post) %>
<% end %>