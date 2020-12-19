const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("shopping_form[number]"),
      cvc: formData.get("shopping_form[cvc]"),
      exp_month: formData.get("shopping_form[exp_month]"),
      exp_year: `20${formData.get("shopping_form[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("shopping_form[number]");
      document.getElementById("card-cvc").removeAttribute("shopping_form[cvc]");
      document.getElementById("card-exp-month").removeAttribute("shopping_form[exp_month]");
      document.getElementById("card-exp-year").removeAttribute("shopping_form[exp_year]");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);