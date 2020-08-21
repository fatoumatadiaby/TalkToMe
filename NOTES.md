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