
  
## Towards the Post-Pandemic World: A Closer Look at the Work-from-Home discussion

With around 77% of the global workforce working from home full-time according to a report by Global Workplace Analytics, 
2020 saw an explosion of google searches for “Zoom Fatigue”.


Now that the end of the pandemic is in sight, there has been much speculation on what the future of work will look like. 
Using worldwide patent application data for “work-from-home” (WFH) related technologies as a proxy for measuring innovation (PATENTSCOPE database), 
we observe that innovation in this space was on the rise prior to the pandemic but seems to have slowed down considerably towards the end of 2020, 
perhaps suggesting that - with much of the needed technology already present - the break-through leading to successful WFH outcomes was 
not so much technological as it was organizational and cultural. With the organizational and cultural infrastructure now in place, workplaces 
are in much better shape to offer employees more work-from-home days post-pandemic than in previous years, making it highly likely that the future of work will feature a hybrid model.


<p align="center">
  <img src="https://github.com/hibahnav/DataVis-/blob/main/animated_patents.gif">
</p>




### Sources:

- Data from WIPO's PATENTSCOPE database: https://patentscope.wipo.int/search/en/search.jsf
- Inspiration on methodology from: https://bfi.uchicago.edu/wp-content/uploads/2020/09/BFI_WP_2020133.pdf

### Methodology

Using the PATENTSCOPE database's simple search feature and taking inspiration from the abovementioned paper, I searched the following terms to obtain patent applications data on work-from-home related technologies:

{work from home, telework, remote work, teleworking, working from home, remote working, work from anywhere, working at home, mobile work, mobile working, videoconference, virtual office,  distance work, virtual work, work remotely, home office,  home based office, home based work, digital work, teleconferencing, telecommuter, telecommuting}

After compiling a full dataset after merging each of the above datasets, I filtered for the years 2019, 2020 and 2021 to compare the amount of patent applications for each year (code to come soon).

This was all done in R.

