import sublime
import sublime_plugin


class CopyProjectPathToClipboardCommand(sublime_plugin.TextCommand):
    """
    Simple command to copy the current project's path to the clipboard. It
    always copies the first folder defined in the project file.
    """
    def run(self, edit):
        """
        Main method to run the command.
        """
        path = self.__get_project_path()
        path = self.__apply_modifications_to_path(path)
        sublime.set_clipboard(path)

    def __get_project_path(self) -> str:
        """
        Fetches the current project first path, if active.
        """
        project_data = self.view.window().project_data()

        try:
            path = project_data.get("folders")[0].get("path")
        except Exception:
            path = None

        return path

    def __apply_modifications_to_path(self, path: str) -> str:
        """
        Applies modifications to the path depending on the plugin settings.
        """
        settings = sublime.load_settings("copy_project_path_to_clipboard.sublime-settings")
        include_quotes = settings.get("include_quotes")
        prefix = settings.get("prefix")
        suffix = settings.get("suffix")

        if include_quotes:
            path = '"' + path + '"'

        if prefix:
            path = str(prefix) + path

        if suffix:
            path = path + str(suffix)

        return path
