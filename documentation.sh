for i in `sqlite3 AdventureWorks.db ".tables"`; do echo $i; sqlite3 AdventureWorks.db "SELECT COUNT(*) FROM $i"; done > adventureworks_docs.html
for i in `sqlite3 AdventureWorks.db ".tables"`; do echo "<h3>$i</h3><table>"; sqlite3 -html -header AdventureWorks.db "PRAGMA table_info('$i');"; echo "</table>"; done >> adventureworks_docs.html
