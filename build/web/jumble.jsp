<%@ page import="java.util.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Jumble Word</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<%
    String inputJumbleWord = request.getParameter("jumble-word-input");
    ArrayList<String> answers = new ArrayList<>();

    if (inputJumbleWord != null && !inputJumbleWord.isEmpty()) {
        inputJumbleWord = inputJumbleWord.toLowerCase();
        char[] jumCharArray = inputJumbleWord.toCharArray();
        int[] jumWordArray = new int[jumCharArray.length];

        for (int i = 0; i < jumCharArray.length; i++) {
            jumWordArray[i] = jumCharArray[i] - '0';
        }
        Arrays.sort(jumWordArray);

        for (int i = 0; i < jumCharArray.length; i++) {
            jumCharArray[i] = (char) (jumWordArray[i] + '0');
        }

        try {
            File fobj = new File(getServletContext().getRealPath("/WEB-INF/words.txt"));
            Scanner fileReader = new Scanner(fobj);

            while (fileReader.hasNextLine()) {
                String fileData = fileReader.nextLine();

                if (fileData.length() == inputJumbleWord.length()) {
                    int[] posAnsArray = new int[fileData.length()];
                    fileData = fileData.toLowerCase();
                    char[] posAns = fileData.toCharArray();

                    for (int x = 0; x < posAns.length; x++) {
                        posAnsArray[x] = posAns[x] - '0';
                    }

                    Arrays.sort(posAnsArray);

                    for (int al = 0; al < posAns.length; al++) {
                        posAns[al] = (char) (posAnsArray[al] + '0');
                    }

                    if (Arrays.equals(posAns, jumCharArray)) {
                        answers.add(fileData);
                    }
                }
            }
            fileReader.close();
        } catch (FileNotFoundException e) {
            answers.add("file not found!");
        }
    }

    if (inputJumbleWord != null && !inputJumbleWord.isEmpty()) {
        out.println("<h1 style='font-family:verdana; text-align:center'> JUMBLED WORD: '<u>" + inputJumbleWord + "</u>'</h1>");
    }

    if (answers.isEmpty()) {
        out.println("<h1 style='font-family:verdana; color:red; text-align:center;'> NO WORDS FOUND!</h1>");
    } else {
        out.println("<h1 style='font-family:verdana'>Words Found :</h1>");
        int count = 1;
        for (String s : answers) {
            out.println("<h3 style='font-family:verdana; color:green'>" + count + ") " + s + "</h3>");
            count++;
        }
    }
%>
</body>
</html>
