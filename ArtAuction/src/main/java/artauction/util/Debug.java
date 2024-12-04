package artauction.util;

import jakarta.servlet.http.HttpSession;

// just general debugging utils
public class Debug {
    static public void printSessionAttributes(HttpSession session) {
        var names = session.getAttributeNames();
        System.err.println("printing session attributes: {");
        while (names.hasMoreElements()) {
            var name = names.nextElement();
            var value = session.getAttribute(name);
            System.err.printf("\t[%s]: %s%n", name, value);
        }
        System.err.println("}");
    }
}
