## How to run:

1.  Create a MySQL database using _structure.sql_ or _data_and_structure.sql_ in `/Database` folder.

2.  Change _jdbc_ url in `/NetBeans Project/web/WEB-INF/web.xml`

    ```xml
    <param-value>jdbc:mysql://host:port/database</param-value>
    ```

3.  Change database _username_ and _password_ in `/NetBeans Project/src/java/listener/WebAppContextListener.java`

    ```java
     DBManager manager = new DBManager(dburl + "?user=username&password=yourpassword");
    ```

4.  Get a _Google API Key_ for Google Maps and replace _GOOGLEAPIKEY_ with your _Key_ in files:

    ```
    NetBeans Project/web/autoCompletamento.jsp
    NetBeans Project/web/listaProdotti.jsp
    NetBeans Project/web/listaProdottiVuota.jsp
    NetBeans Project/web/negozio.jsp
    ```

5.  Open the _NetBeans Project_ folder in NetBeans.

6.  Add the _libraries_ inside `/libraries` folder to the Netbeans project.

7.  Run the project and if you have Tomcat it should deploy and start.

## Screenshots

1.  Home

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Home.png?raw=true 'Home')

2.  Login

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Login.png?raw=true 'Login')

3.  Logged In

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Logged%20In.png?raw=true 'Logged In')

4.  Products List

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Product%20List.png?raw=true 'Products List')

5.  Product

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Product%20Page.png?raw=true 'Product')

6.  Cart

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Cart.png?raw=true 'Cart')

7.  Payment

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Payment%20Page.png?raw=true 'Payment')

8.  Shop

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Shop%20Page.png?raw=true 'Shop')

9.  Orders Management

![alt text](https://github.com/mattiapv/M.A.N.A.-JavaEE_Project/blob/master/Screenshots/Orders%20Management%20.png?raw=true 'Orders Management')
