*** Variables ***
# Products Page Locators
${PRODUCTS_TITLE}           xpath://span[@class='title'][text()='Products']
${PRODUCT_SORT_DROPDOWN}    xpath://select[@class='product_sort_container']
${INVENTORY_CONTAINER}      xpath://div[@class='inventory_container']
${PRODUCT_ITEM}             xpath://div[@class='inventory_item']
${ADD_TO_CART_BUTTON}       xpath://button[contains(@class,'btn_inventory')]
${SHOPPING_CART_BADGE}      xpath://span[@class='shopping_cart_badge']
${SHOPPING_CART_LINK}       xpath://a[@class='shopping_cart_link']
${MENU_BUTTON}              id:react-burger-menu-btn
${LOGOUT_LINK}              id:logout_sidebar_link
${ADD_TO_CART_BUTTON_BY_NAME}   //*[@id='add-to-cart-sauce-labs-backpack']
