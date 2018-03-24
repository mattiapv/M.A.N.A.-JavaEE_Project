package HTML;

public final class HTMLFilter {

    public static String filter(String message) {

        if (message == null) {
            return (null);
        }

        char content[] = new char[message.length()];

        message.getChars(0, message.length(), content, 0);

        StringBuffer result = new StringBuffer(content.length + 50);

        for (int i = 0; i < content.length; i++) {
            switch (content[i]) {
                case '<':

                    result.append("&lt;");

                    break;

                case '>':

                    result.append("&gt;");

                    break;

                case '&':

                    result.append("&amp;");

                    break;

                case '"':

                    result.append("&quot;");

                    break;

                case '–':

                    result.append("-");

                    break;

                case '“':

                    result.append("&#8220");

                    break;

                case '”':

                    result.append("&#8221");

                    break;

                case '™':

                    result.append("&#8482");

                    break;

                default:

                    result.append(content[i]);

            }

        }

        return (result.toString());

    }
}
