*** Variables ***
# Cart Page Locators
${CART_TITLE}               xpath://span[@class='title'][text()='Your Cart']
${CART_ITEM}                xpath://div[@class='cart_item']
${CART_ITEM_NAME}           xpath://div[@class='inventory_item_name']
${REMOVE_BUTTON}            xpath://button[contains(@class,'cart_button')]
${CONTINUE_SHOPPING_BUTTON}  id:continue-shopping
${CHECKOUT_BUTTON}           xpath://*[@id='checkout']
