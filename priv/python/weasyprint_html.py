from weasyprint import HTML

def write_pdf(html):
    return HTML(string=html.decode('utf-8')).write_pdf()