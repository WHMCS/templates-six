<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Oops!</title>
    <style>
        body {
            margin: 30px 40px;
            background-color: #f6f6f6;
        }
        .error-container {
            padding: 50px 40px;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 14px;
        }
        h1 {
            margin: 0;
            font-size: 48px;
            font-weight: 400;
        }
        h2 {
            margin: 0;
            font-size: 26px;
            font-weight: 300;
        }
        a {
            color: #336699;
        }
        p.back-to-home {
            margin-top: 30px;
        }
        p.debug{
            padding: 20px 0px;
            font-family: "Courier New", Courier, monospace, serif;
            font-size: 14px;
        }
        .info {
            border: solid 1px #999;
            padding: 5px;
            background-color: #d9edf7;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Oops!</h1>
    <h2>Something went wrong and we couldn't process your request.</h2>
    <p>Please go back to the previous page and try again.</p>
    <p>If the problem persists, please <a href="mailto:{{email}}">contact us</a>.</p>
    <p class="back-to-home"><a href="{{systemurl}}">&laquo; Back to Homepage</a></p>
    {{environmentIssues}}
    <p class="debug">{{adminHelp}}<br/>{{stacktrace}}</p>
</div>
</body>
</html>