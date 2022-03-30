 <!DOCTYPE html>
<html>
<head>
    <title>Rīgas Valsts tehnikums</title>
</head>
<body style='padding: 0px;margin: 0px;    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";'>

<div id="header" style="background-color: #343a40;height: 60px; width: 100%; display: flex;">
    <img src="https://is.rvt.lv/images/logo.webp" alt="Rīgas Valsts tehnikums" style="width: auto; height: 60px; margin-left: 10px;">
    <span style="line-height: 60px;font-size: 20px;color: rgba(255,255,255,.5);">Rīgas Valsts tehnikums</span>
</div>
    <div id="container" style="width: 100%; height: 100px; display: flex;">
        <div id="row" style="margin: 10px; width: 100%; height: 100%;">
            <p>
                Sveicināti, {{ $user->name }} {{ $user->surname }}!
            </p>
            <p style="margin-left: 10px;">
                Jums ir pienācis paziņojums no <a href="https://is.rvt.lv">Rīgas Valsts tehnikuma informācijas sistēmas</a>.<br>
                Normatīvais akts "{{ $regulation }}" tika atjaunots.<br>
                Pieslēdzieties sistēmā, un aplūkojiet normatīvo aktu izmaiņas.
            </p>
            <p>
                Paldies!
            </p>
        </div>
    </div>
</body>
</html>
