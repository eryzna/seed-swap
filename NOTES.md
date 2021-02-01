A user signs in to seed swap to view seeds offered for swap by her neighbors. The user can create her own swap and publish it to her neighborhood swap board. A user can only view swaps in her immediate neighborhood, which is determined by zip code. A user can filter swaps by seed type and/or category. 

UI: A swap board. Each swap has a photo, seed.category, user.zip code, seed.quantity, user.name (first and last initial), seed.name

Additional: Upon deciding on a swap, a user can contact the swap's owner via a contact form. 

User: 
Has a name, password, zipcode.  Possibly an email down the road. 

Seeds: 
Have a name and category.
Have many swaps. Have many users through swaps.
Belongs to category???

Swap: 
Has a title and quantity.
Belongs to user and to seed.
Join table

Categories
Vegetable, fruit, herbs, flowers

**NEED**
Collection_select for seeds, or else create one new seed
Method that amends user's seed quantity after each swap; swaps have a seed name?
User update does not work when validations present, i.e., update user object isn't saved
Validations
    Zip code valid U.S. zip-code
    email doesn't exist
    username doesn't exist
    valid email
    valid password
    valid zip code
No swaps to show! if there are no swaps in area
Function that filters swaps by seed category
*Method that filters swaps by zip code*
*Need to restrict seed/swaps to zip code*
*Stop new users via omniauth from viewing app*
*Need to ensure certain pages are only viewable when the user is logged in*
*Edit user with new zip code*
*Restricting access to other profiles*

User signup validations
User name exists!
Email exists!


<% if @neighbor_swaps%>
    <% @neighbor_swaps.each do |t|%>
        <% t.each do |p|%>
        <br>
         <li><%=p.title%></li>
         <h3> <%= link_to p.user.first_name, user_swaps_path(p.user) %></h3>
         <p><%=p.user.first_name%> <%=p.user.last_name.first%>.</p>
         <td><%= link_to "View Swap", swap_path(p.id) %></td>
         <br>
        <%end%>
    <%end%>
<% else%>
    <h1> No Swaps to Show! </h1>
<%end%>


