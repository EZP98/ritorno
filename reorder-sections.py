#!/usr/bin/env python3
import re

# Leggi il file
with open('index-temp.html', 'r', encoding='utf-8') as f:
    content = f.read()

# Trova le sezioni
texts_match = re.search(r'(<!-- Critical Texts Section -->.*?</section>)', content, re.DOTALL)
alf_match = re.search(r'(<!-- ALF Section -->.*?</section>\s*(?=\s*<!-- Works Section -->))', content, re.DOTALL)
works_match = re.search(r'(<!-- Works Section -->.*?</section>)', content, re.DOTALL)

if texts_match and alf_match and works_match:
    texts_section = texts_match.group(1)
    alf_section = alf_match.group(1)
    works_section = works_match.group(1)
    
    # Trova la posizione dove iniziano le sezioni
    sections_start = content.find('<!-- Critical Texts Section -->')
    
    # Trova la posizione dopo l'ultima sezione
    sections_end = content.find('</div>', content.find('<!-- Works Section -->')) + 6
    
    # Ricostruisci il file con l'ordine corretto
    new_content = (
        content[:sections_start] +
        texts_section + '\n        \n        ' +
        works_section + '\n        \n        ' +
        alf_section + '\n    ' +
        content[sections_end:]
    )
    
    # Scrivi il nuovo file
    with open('index.html', 'w', encoding='utf-8') as f:
        f.write(new_content)
    
    print("File riordinato con successo!")
else:
    print("Errore: non sono riuscito a trovare tutte le sezioni")