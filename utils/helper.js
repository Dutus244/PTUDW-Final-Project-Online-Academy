export const getVisiblePage = (totalPages, visiblePages, curPage) => {
    // Limit the visible page
    if (visiblePages > totalPages) {
        visiblePages = totalPages;
    }
    const half = Math.floor(visiblePages / 2);
    var start = curPage - half + 1 - visiblePages % 2;
    var end = curPage + half;

    // handle boundary case
    if (start <= 0) {
        start = 1;
        end = visiblePages;
    }
    if (end > totalPages) {
        start = totalPages - visiblePages + 1;
        end = totalPages;
    }

    const pages = []
    for (let i = start; i <= end; i++) {
        pages.push({
            value: i,
            isCurrent: i === +curPage
        })
    }
    return pages
}
