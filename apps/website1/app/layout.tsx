
import "./globals.css"
import ThemeProvider from "@repo/ui/src/features/theme/theme-provider";
export default function Layout({children} : {children : React.ReactNode}) {
        return (
                <html suppressHydrationWarning lang="en">
                        <body>
                                <ThemeProvider>
                                        {children}
                                </ThemeProvider>
                        </body>
                </html>
        );
}
